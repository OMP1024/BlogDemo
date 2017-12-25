组件的大小可以由：
1.flex 的 value 值决定在父组件中占比。
2.width/height 的固定宽高决定。
3.不设置 flex width/height则由其子组件自动填充决定。 
4.flex 的优先级高于 width、height，如果设置了宽高就不要在设置 flex 属性


bool
boolean

react-native bundle --platform android --dev false --entry-file index.android.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res/
