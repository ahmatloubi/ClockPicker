//
//  ClockPickerView.swift
//  ClockPicker
//
//  Created by AmirHossein Matloubi on 12/14/1401 AP.
//

import SwiftUI

struct ClockPickerView: View {
    let width = UIScreen.main.bounds.width - 30
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(uiColor: .tertiarySystemFill))
            ForEach(0...59, id: \.self) { second in
                    secondView(second: second)
                    .rotationEffect(.init(degrees: angleFor(second: second)))
            }
            .rotationEffect(.init(degrees: 180))
        }
        .frame(width: width, height: width)
        
            
    }
    
    @ViewBuilder
    func secondView(second: Int) -> some View {
        VStack(spacing: 5) {
            if hasNumber(second: second) {
                Text(number(second: second))
                    .frame(width: 25, height: 10)
                    .rotationEffect(.init(degrees: (-1 * angleFor(second: second)) + 180))
            }
            
            Rectangle()
                .fill(Color.secondary)
                .frame(width: 2, height: height(second: second))

        }
        .offset(y: offset(second: second))
    }
}

extension ClockPickerView {
    
    func number(second: Int) -> String {
        if second == 0 {
            return "12"
        } else {
            let intHour = Int(second / 5)
            return String(intHour)
        }
    }
    
    func shouldNumberRotate(second: Int) -> Bool {
        second >= 45 || second <= 15
    }
    
    func hasNumber(second: Int) -> Bool {
        second % 5 == 0
    }
    
    func offset(second: Int) -> CGFloat {
        hasNumber(second: second) ? (width - height(second: second) - 15) / 2 : (width - height(second: second)) / 2
    }
    
    
    func angleFor(second: Int) -> Double  {
        Double((360 / 60) * second)
    }
    
    func height(second: Int) -> CGFloat  {
        second % 5 == 0 ? 15 : 5
    }
}

struct ClockPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ClockPickerView()
    }
}
