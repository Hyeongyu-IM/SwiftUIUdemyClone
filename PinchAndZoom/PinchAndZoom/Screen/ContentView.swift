//
//  ContentView.swift
//  PinchAndZoom
//
//  Created by 임현규 on 11/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    func resetImageState() {
        return withAnimation(.spring(.bouncy)) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.clear
                
                Image(.thumbMagazineFrontCover)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                //MARK: -- 1. Tap Gesture
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring(.bouncy)) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    })
                //MARK: -- 2. Drag Gesture
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            })
                            .onEnded({ _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            })
                    )
                //MARK: -- 3. Magnification
                    .gesture(
                        //두 손가락 제스처가 들어올때
                        MagnificationGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = value
                                    } else if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            })
                            .onEnded({ _ in
                                if imageScale > 5 {
                                    imageScale = 5
                                } else if imageScale <= 1 {
                                    resetImageState()
                                }
                            })
                            
                    )
            } //: ZStack
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
            //MARK: -- Info Panel
            .overlay(alignment: .top) {
                infoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
            }
            //MARK: -- Control
            .overlay(alignment: .bottom) {
                Group {
                    HStack {
                        // Scale down
                        Button(action: {
                            withAnimation(.spring(.bouncy)) {
                                if imageScale > 1 {
                                    imageScale -= 1
                                    
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                        }, label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        })
                        // Reset
                        Button(action: {
                            resetImageState()
                        }, label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        })
                        
                        // Scale Up
                        Button(action: {
                            withAnimation(.spring(.bouncy)) {
                                if imageScale < 5 {
                                    imageScale += 1
                                    
                                    if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                        }, label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        })
                    }//: Controls
                    .padding(.init(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .opacity(isAnimating ? 1 : 0)
                }
                .padding(.bottom, 30)
            }
        }//: Navigation
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
