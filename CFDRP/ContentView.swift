//
//  ContentView.swift
//  warikan1
//
//  Created by 森田晋 on 2021/12/08.
//

import SwiftUI

struct ContentView: View {
    @State private var total = "12"
    @State private var ninzu = 2
    @State private var omosa:Float = 0
    @State private var hasu = 0
    @State private var unit:Int = 6
    @State private var inputError = false
    @State private var msg = ""
    
    var body: some View {
        VStack{
            Text("ドリップくん")
                .font(.largeTitle)
            HStack{
                Text("豆の重さ：　")
                TextField("000", text: $total)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                Text("ｇ")
            }
//            Stepper(value: $ninzu, in: 2...10){
//                Text("人数： \(ninzu)人")
//            }
            HStack{
                Text("濃さ：　")
                Picker(selection: $unit, label: Text("入れ方")){
                    Text("普通").tag(6)
                    Text("やや濃い").tag(7)
                    Text("濃い").tag(8)
//                    ここのunitがわからないPicker?
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Button(action: {
                calc()
            }) {
                Text("計算")
                    .foregroundColor(.white)
                    .background(Capsule()
                                    .foregroundColor(.purple))
                    .frame(width: 120, height: 50)
            }
            .alert(isPresented: $inputError) {
                Alert(title: Text("入力エラー"), message: Text(self.msg), dismissButton: .default(Text("OK")))
            }
            if omosa != 0{
                Text("最初は： " + String(format: "%.1f" , omosa) + "ｇまで")
                Text("次は： " + String(format: "%.1f" , omosa * 2) + "ｇまで")
                Text("最後は：" + String(format: "%.1f" , omosa * 5) + "ｇまで入れる")
            }
            Rectangle()
                .foregroundColor(.blue)
                .onTapGesture {
                    UIApplication.shared
                        .sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            
        }
        .font(.title)
        .background(Color.yellow)
    }
    func calc() {
        if let totalF = Float(total) {
            let unitF = Float(unit)
            let kingakuReal = (totalF / unitF) * 100
            omosa = kingakuReal / 5
//            小数の掛け算ができない
            hasu = Int(omosa)
            if omosa == 0 {
//                msg = "\(unit * ninzu)円以上の金額を入力してください"
                inputError = true
            }
        } else {
            msg = "正しい金額を入力してください"
            inputError = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
