1、JSX 语法没有前向声明，组件的定义要在使用之前。

RN app 的组件的结构。

栈导航作为根组件来管理组件的Push Pop

const MainNavigator = StackNavigator(
	// 配置路由
	{
		// TabNavigator
		Tab: { 
			screen: TabNavigator(
				// 配置路由
				{	
					// 普通 Component
					Home: { screen: HomePage },
					Near: { screen: NearPage },
					Order: { screen: OrderPage },
					Mine: { screen: MinePage },
				},
				// 配置选项卡的通用样式
				{
					tabBarComponent: TabBarBottom,
    				tabBarPosition: 'bottom',
   					swipeEnabled: true,
    				animationEnabled: true,
   					lazy: true,
    				tabBarOptions: {
        					activeTintColor: color.theme,
        					inactiveTintColor: color.tabbartitle,
        					style: { backgroundColor: '#fff' }
    				}
				}
			)
		},
		// 普通的Component
		Detail: {
			screen: DetailPage
		},
		Web: {
			screen: WebPage
		}
	},
	// 配置导航栏的通用样式
	{
		navigationOptions:{
        	headerStyle:{backgroundColor: color.theme},
        	headerBackTitle:null,
        	headerTintColor:'#333',
        	showIcon:true,
    	},
	}
)

render(){
	return(
		<MainNavigator/>
	);
}

注意生成的 MainNavigator 渲染必须作为根组件返回。
render(){
	return(
		<View>
			<MainNavigator/>
		</View>
	);
}
这样渲染会有幺蛾子哦。

关于导航组件 StackNavigator TabNavigator api 的使用可以去官网查看。

			

