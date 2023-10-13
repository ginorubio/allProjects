
import UIKit
import FSCalendar

class MBAlertComponentSelectSingleDateView: UIView {

    @IBOutlet weak var calendarView: FSCalendar!

    //NewUI
    //@IBOutlet weak var calendarWidthConstraint: NSLayoutConstraint! //Para la parte superior
    @IBOutlet weak var nextBtnNewUI: UIButton!
    @IBOutlet weak var prevBtnNewUI: UIButton!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!

    private var currentPage: Date?

    private lazy var today: Date = {
        return Date()
    }()
    
    private let aFrame = CGRect(x: 0, y: 0, width: 350, height: 300)
    //private var selectedDates = [Date]() //not use
    private var isNewUI: Bool = false
    private let widthSpaceCalendarMenu: CGFloat = -30
    
    private var selectedDate: Date?
    var setNewUI: Bool {
        set {
            updateDesign(update: newValue)
        }
        get { isNewUI }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    init() {
        super.init(frame: aFrame)
        initialize()
    }

    
    func initialize() {
        Bundle.main.loadNibNamed("MBAlertComponentSelectSingleDateView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        calendarView.delegate =  self
        calendarView.dataSource = self
        
        
        calendarView.locale = Locale(identifier: "es_AR")
        
        configureDesignButtons()
        configureCalendarHeader()
        configureDayDesign()
        configureDaySelectedDesign()
    
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        calendarView.select(tomorrow)
        selectedDate = tomorrow
        
        //selectedDates.append(tomorrow!) //quitar
        //calendarView.reloadData()
        
    }
    
    func configureDesignButtons() {
        nextBtn.backgroundColor = UIColor.orange //MBConstant.MB_APP_PRIMARY_COLOR
        prevBtn.backgroundColor = UIColor.orange //MBConstant.MB_APP_PRIMARY_COLOR
    }
    
    func configureCalendarHeader(){
        calendarView.appearance.caseOptions = [.headerUsesCapitalized,.weekdayUsesSingleUpperCase]
        calendarView.appearance.weekdayTextColor = UIColor.gray
        calendarView.appearance.headerTitleAlignment = .center
        
        calendarView.appearance.headerTitleColor = UIColor.white
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        calendarView.appearance.headerTitleFont = UIFont.systemFont(ofSize: 15, weight: .medium)
        calendarView.headerHeight = 44.0
        
        calendarView.calendarHeaderView.backgroundColor = UIColor.orange //MBConstant.MB_APP_PRIMARY_COLOR
    }
    
    func configureDayDesign(){
        calendarView.appearance.todayColor = UIColor.clear
        calendarView.appearance.titleTodayColor = UIColor.darkGray
        
        calendarView.appearance.titleDefaultColor = UIColor.darkGray
    }
    
    func configureDaySelectedDesign(){
        calendarView.appearance.titleSelectionColor = UIColor.white
        calendarView.appearance.selectionColor = UIColor.orange //MBConstant.MB_APP_PRIMARY_COLOR
    }
    
    private func updateDesign(update: Bool) {
        isNewUI = update
        calendarView.appearance.headerTitleAlignment = update ? .left : .center
        nextBtn.isHidden = update
        prevBtn.isHidden = update
        nextBtnNewUI.isHidden = !update
        prevBtnNewUI.isHidden = !update
        
        calendarView.select(Date())
        selectedDate = Date()
        /*
        selectedDates.removeAll()
        selectedDates.append(Date())*/
    }
    
    @IBAction func nextBtnTouched(_ sender: UIButton) {
        moveCurrentPage(moveUp: true)
    }
    
    @IBAction func previusBtnTouched(_ sender: UIButton) {
        moveCurrentPage(moveUp: false)
    }
    
    /*
    func isInDateSelected(_ date: Date) -> Bool {
        for aDate in selectedDates {
            if (date == aDate){
                return true
            }
        }
        return false
    }*/
    
    private func moveCurrentPage(moveUp: Bool) {
        
        let calendarCurrent = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = moveUp ? 1 : -1
        
        self.currentPage = calendarCurrent.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        self.calendarView.setCurrentPage(self.currentPage!, animated: true)
    }

    public func getSelectedDate() -> Date? {
        return self.selectedDate
    }
    
}

extension MBAlertComponentSelectSingleDateView: FSCalendarDelegate , FSCalendarDataSource{
    
   
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        /*
        self.selectedDates.removeAll() //quitar
        self.selectedDates.append(date) //quitar*/
        self.selectedDate = date
        let cell = self.calendarView.cell(for: date, at: monthPosition)
        self.drawSelectedDay(cell)
        
        
    }
    
    func drawSelectedDay(_ dayView: FSCalendarCell?) {
        guard let dayView = dayView else { return }
        dayView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.transition(with: dayView,
                          duration: 0.3,
                          options: .curveEaseInOut,
                          animations: {
                            dayView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        if date.isBeforeMonth() {
            cell.isUserInteractionEnabled = false
            cell.appearance.titleDefaultColor = .lightGray
        }else{
            cell.isUserInteractionEnabled = true
            cell.appearance.titleDefaultColor = .darkGray
        }
        
    }
}

extension MBAlertComponentSelectSingleDateView: FSCalendarDelegateAppearance{
    
    
    
}

public extension Date{
    
    func isBeforeMonth() -> Bool {
        var calendario = Calendar.current
        calendario.locale = Locale(identifier: "es_AR")
        let result = calendario.compare(self, to: Date(), toGranularity: .month)
        print(result.rawValue)
        return ( result.rawValue == -1) ? true : false
    }
}
