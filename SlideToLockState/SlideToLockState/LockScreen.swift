//
//  LockScreen.swift
//  SlideToLockState
//
//  Created by Liu Chuan on 2020/11/2.
//

import SwiftUI

enum LockState {
    case UnLock
    case PowerOff
    case SOS
}


struct LockScreen: View {
    
    /// 文字透明度
    @State var textOpacity: Double = 1.0
    /// 偏移量
    @State private var offset: CGFloat = 0
    /// 进度
    @State private var progress = 0
    
    /// 胶囊形状的宽度
    private var capsuleWidth: CGFloat = 300
    /// 胶囊形状的高度
    private var capsuleHeight: CGFloat = 70
    /// 文字
    private var displayText: String
    /// 滑块图片名称
    private var sliderPictureName: String = ""
    /// 当前锁屏状态
    private var currentLockSate: LockState
    
    
    /// 初始化
    /// - Parameter state: 锁屏状态
    init(state: LockState) {
        currentLockSate = state
        switch state {
        case .PowerOff:
            displayText = "slide to power off"
            sliderPictureName = "power"
        case .UnLock:
            displayText = "slide to unlock"
            sliderPictureName = "chevron.right.2"
        case.SOS:
            displayText = "Emergency SOS"
            sliderPictureName = ""
        }
    }
    
    var body: some View {
        ZStack {
            // 设置背景色
            Color(.black)
                .ignoresSafeArea(.all, edges: .all)
            VStack {
                ZStack {
                    Capsule() // 胶囊形状
                        .fill(Color.gray.opacity(0.1))
                    
                    // 文字
                    Text(displayText)
                        .fontWeight(.regular)
                        .font(.system(size: 25))
                        .modifier(Shimmer())
                        .padding(.trailing, -40)
                    
                    // 滑块
                    HStack {
                        ZStack {
                            if currentLockSate == .SOS {
                                Text("SOS")
                                    .font(.title)
                            }
                            else {
                                Image(systemName: sliderPictureName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)
                            }
                        }
                        .frame(width: capsuleHeight, height: capsuleHeight)
                        .foregroundColor(currentLockSate == .SOS  ? .white : .red)
                        .background(currentLockSate == .SOS  ? Color.red : .white)
                        .clipShape(Circle())
                        .offset(x: self.offset)
                        // 添加手势
                        .gesture(DragGesture().onChanged(self.onChanged(_:)).onEnded(self.onEnd(_:)))
                        
                        Spacer()
                    }
                }
                .frame(width: capsuleWidth, height: capsuleHeight, alignment: .center)
                .padding(.vertical)
            }
        }
    }
    
}


// MARK: - Actions
extension LockScreen {
    
    /// 开始拖动修改
    /// - Parameter value: 拖动的值
    func onChanged(_ value: DragGesture.Value) {
        
        // 拖动时的 X 值
        let currentX = value.translation.width
        // 防止滑块出界
        if currentX > 0 && self.offset <= capsuleWidth - capsuleHeight {
            self.offset = currentX
            self.textOpacity = Double(1.0 - currentX / capsuleWidth)
        }
    }
    
    /// 拖动结束
    /// - Parameter value: 拖动的值
    func onEnd(_ value: DragGesture.Value) {
        
        withAnimation(Animation.easeOut(duration: 0.3)) {
            // 如果拖动的值，过了胶囊形状的一半，设置滑块的位置位于右边
            if offset > capsuleWidth / 2 {
                offset = capsuleWidth - capsuleHeight
                // 延迟0.25秒，发送通知，代表解锁成功
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    NotificationCenter.default.post(name: Notification.Name("Success"), object: nil)
                }
            }else { // 滑块位于左
                offset = 0
            }
        }
    }
    
}
