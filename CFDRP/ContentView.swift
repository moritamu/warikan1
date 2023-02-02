//
//  ContentView.swift
//  warikan1
//
//  Created by 森田晋 on 2021/12/08.
//

import SwiftUI

struct ContentView: View {
    @State private var total = "12"//豆の量
    @State private var ninzu = 2//使ってない
    @State private var omosa:Float = 0
    @State private var hasu = 0//使ってない
    @State private var unit:Int = 6//出来上がりコーヒー100gあたりの豆の重さ
    @State private var inputError = false//アラート表示のためのフラグ
    @State private var msg = ""
    let soundPlayer = SoundPlayer()
    
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
            .padding(.vertical)
            Button(action: {
                calc()
                soundPlayer.cymbalPlay()
            }) {
                Text("お湯の注ぎ方")
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Capsule()
                    )
                    .colorMultiply(Color.white)
                
                
                
            }
                .padding(.vertical)
            //inputErrorでアラートを表示する
            .alert(isPresented: $inputError) {
                Alert(title: Text("入力エラー"), message: Text(self.msg), dismissButton: .default(Text("OK")))
            }
            if omosa != 0{
                Spacer()
                Text("３回に分けます。")
                Spacer()
                Text("最初は： " + String(format: "%.1f" , omosa) + "ｇまで")
                Spacer()
                Text("次は： " + String(format: "%.1f" , omosa * 2) + "ｇまで")
                Spacer()
                Text("最後は：" + String(format: "%.1f" , omosa * 5) + "ｇまで入れる")
                Spacer()
            }
            Spacer()
//            Rectangle()
//                .foregroundColor(Color(red: 0.2, green: 0.3, blue: 0.6, opacity: 0.1))
//                .onTapGesture {
//                    UIApplication.shared
//                        .sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                }
            Text("おいしいコーヒーをいれましょう！")
                .font(.title3)
                .foregroundColor(.white)
        }
        .padding(.vertical)
        .font(.title)
        .background(Color(red: 0.2, green: 0.4, blue: 0.9, opacity: 0.4))
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
