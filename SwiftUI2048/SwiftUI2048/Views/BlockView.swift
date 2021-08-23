import SwiftUI

struct BlockView : View {
    
    private let colorScheme: [(Color, Color)] = [
        (Color(red:0.91, green:0.87, blue:0.83, opacity:1.00), Color(red:0.42, green:0.39, blue:0.35, opacity:1.00)),
    
        (Color(red:0.90, green:0.86, blue:0.76, opacity:1.00), Color(red:0.42, green:0.39, blue:0.35, opacity:1.00)),
        
        (Color(red:0.93, green:0.67, blue:0.46, opacity:1.00), Color.white),
        
        (Color(red:0.94, green:0.57, blue:0.38, opacity:1.00), Color.white),
        
        (Color(red:0.95, green:0.46, blue:0.33, opacity:1.00), Color.white),
        
        (Color(red:0.94, green:0.35, blue:0.23, opacity:1.00), Color.white),
        
        (Color(red:0.91, green:0.78, blue:0.43, opacity:1.00), Color.white),
        
        (Color(red:0.91, green:0.78, blue:0.37, opacity:1.00), Color.white),
        
        (Color(red:0.90, green:0.77, blue:0.31, opacity:1.00), Color.white),
        
        (Color(red:0.91, green:0.75, blue:0.24, opacity:1.00), Color.white),
        
        (Color(red:0.91, green:0.74, blue:0.18, opacity:1.00), Color.white),
    ]
    
    private let number: Int?
    private let textId: String?
    
    init(block: IdentifiedBlock) {
        self.number = block.number
        self.textId = "\(block.id):\(block.number)"
    }
    
    private init() {
        self.number = nil
        self.textId = ""
    }
    
    static func blank() -> Self {
        return self.init()
    }
    
    private var numberText: String {
        guard let number = number else {
            return ""
        }
        return String(number)
    }
    
    private var fontSize: CGFloat {
        let textLength = numberText.count
        if textLength < 3 {
            return 32
        } else if textLength < 4 {
            return 18
        } else {
            return 12
        }
    }
    
    private var colorPair: (Color, Color) {
        guard let number = number else {
            return (Color(red:0.78, green:0.73, blue:0.68, opacity:1.00), Color.black)
        }
        let index = Int(log2(Double(number))) - 1
        if index < 0 || index >= colorScheme.count {
            fatalError("No color for such number")
        }
        return colorScheme[index]
    }
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorPair.0)
                .zIndex(1)

            Text(numberText)
                .font(Font.system(size: fontSize).bold())
                .foregroundColor(colorPair.1)
                .id(textId!)
                .zIndex(1000)
                .transition(AnyTransition.opacity.combined(with: .scale))
        }
        .clipped()
        .cornerRadius(6)
    }
}
