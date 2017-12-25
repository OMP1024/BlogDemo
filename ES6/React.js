一、JSX 语法

1.在 JSX 中嵌入表达式：
在 JSX 中嵌入表达式，必须用{}将表达式括起来。

var element = <h1>Hello, world!</h1>;

<h1> Hello { 1 + 3 }</h1>;

2.JSX 中为 element 指定属性值。

- 通过字符串的形式
- 通过{表达式}的形式

二、函数式组件

定义一个函数式组件：
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}

使用：
<Welcome name = "world"/>


三、类组件

class Welcome extends React.Component{
	render(){
		return(
			<h1>Hello, {props.name}</h1>;
			);
	}
}

使用：
<Welcome name = "world"/>

对比：
函数式组件和类组件的名称首字母必须大写。所有组件的首字母都是大写的。元素是小写。
函数式组件的函数是纯函数。
函数式组件没有 state状态机变量，渲染的内容只能靠 props 来决定。

纯函数：相同的输入一定得到相同的输出。

四、状态机变量 state 的正确使用

1、取值
this.state.comment;

2、修改
this.setState({comment:"Hello"});

不能直接修改：
this.state.comment = "Hello";
直接赋值形式只能在构造函数 constructor 中使用。

3、setState()函数
setState()函数接受两种形式的对象。
- 普通的对象
	this.setState({comment:"Hello"});
- 箭头函数对象,箭头函数的参数，参数1是上个状态的 state，参数2是更新时的 props 属性 
	this.setState((prevState,props) =>({
		comment:prevState.comment + `{props.name}`
	});
- 也可以是常规函数
	this.setState(function(prevState,props){
		return {comment:prevState.comment + `{props.name}`};
	});
函数对象的参数可选的。

4、state状态的变量是合并而不是覆盖。
就是 setState()函数只会设置对应的变量不影响其他变量。

函数事件需要绑定的原因分析：
ES6中 function var 声明的变量是全局变量。

五、条件渲染

布尔值 && 表达式
布尔值为 false，直接忽略渲染。
布尔值为 true，返回表达式的渲染。

布尔值 ? 表达式1 : 表达式2
布尔值为 true 时，渲染表达式1
布尔值为 false 时，渲染表达式2

六、阻止渲染
Booleans, Null, 和 Undefined 被忽略
以下等价:
<div />

<div></div>

<div>{false}</div>

<div>{null}</div>

<div>{undefined}</div>

<div>{true}</div>

七、属性扩展

如果你已经有一个 object 类型的 props，并且希望在 JSX 中传入，你可以使用扩展操作符 ... 传入整个 props 对象。这两个组件是等效的：

function App1() {
  return <Greeting firstName="Ben" lastName="Hector" />;
}

function App2() {
  const props = {firstName: 'Ben', lastName: 'Hector'};
  return <Greeting {...props} />;
}
当你构建一个一般容器时，属性扩展非常有用。然而，这可能会使得你的代码非常混乱，因为这非常容易使一些不相关的 props(属性) 传递给组件，而组件并不需要这些 props(属性) 。因此我们建议谨慎使用该语法。


八、通过 PropTypes 进行类型检查

import PropTypes from 'prop-types';

class Greeting extends React.Component {
  render() {
    return (
      <h1>Hello, {this.props.name}</h1>
    );
  }
}

// 类型检查
Greeting.propTypes = {
  name: PropTypes.string
};

// 指定 props 的默认值：
Greeting.defaultProps = {
  name: 'Stranger'
};

类型检查
MyComponent.propTypes = {
  // 你可以声明一个 prop 是一个特定的 JS 原始类型。 
  // 默认情况下，这些都是可选的。
  optionalArray: PropTypes.array,
  optionalBool: PropTypes.bool,
  optionalFunc: PropTypes.func,
  optionalNumber: PropTypes.number,
  optionalObject: PropTypes.object,
  optionalString: PropTypes.string,
  optionalSymbol: PropTypes.symbol,

  // 任何东西都可以被渲染:numbers, strings, elements,或者是包含这些类型的数组(或者是片段)。
  optionalNode: PropTypes.node,

  // 一个 React 元素。
  optionalElement: PropTypes.element,

  // 你也可以声明一个 prop 是类的一个实例。 
  // 使用 JS 的 instanceof 运算符。
  optionalMessage: PropTypes.instanceOf(Message),

  // 你可以声明 prop 是特定的值，类似于枚举
  optionalEnum: PropTypes.oneOf(['News', 'Photos']),

  // 一个对象可以是多种类型其中之一
  optionalUnion: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number,
    PropTypes.instanceOf(Message)
  ]),

  // 一个某种类型的数组
  optionalArrayOf: PropTypes.arrayOf(PropTypes.number),

  // 属性值为某种类型的对象
  optionalObjectOf: PropTypes.objectOf(PropTypes.number),

  // 一个特定形式的对象
  optionalObjectWithShape: PropTypes.shape({
    color: PropTypes.string,
    fontSize: PropTypes.number
  }),

  // 你可以使用 `isRequired' 链接上述任何一个，以确保在没有提供 prop 的情况下显示警告。
  requiredFunc: PropTypes.func.isRequired,

  // 任何数据类型的值
  requiredAny: PropTypes.any.isRequired,

  // 你也可以声明自定义的验证器。如果验证失败返回 Error 对象。不要使用 `console.warn` 或者 throw ，
  // 因为这不会在 `oneOfType` 类型的验证器中起作用。
  customProp: function(props, propName, componentName) {
    if (!/matchme/.test(props[propName])) {
      return new Error(
        'Invalid prop `' + propName + '` supplied to' +
        ' `' + componentName + '`. Validation failed.'
      );
    }
  },

  // 也可以声明`arrayOf`和`objectOf`类型的验证器，如果验证失败需要返回Error对象。
  // 会在数组或者对象的每一个元素上调用验证器。验证器的前两个参数分别是数组或者对象本身，
  // 以及当前元素的键值。
  customArrayProp: PropTypes.arrayOf(function(propValue, key, componentName, location, propFullName) {
    if (!/matchme/.test(propValue[key])) {
      return new Error(
        'Invalid prop `' + propFullName + '` supplied to' +
        ' `' + componentName + '`. Validation failed.'
      );
    }
  })
 }


九、Refs 和 DOM

在 DOM 元素上添加 Ref
React 支持给任何组件添加特殊属性。ref 属性接受回调函数，并且当组件 装载(mounted) 或者 卸载(unmounted) 之后，回调函数会立即执行。
当给 HTML 元素添加 ref 属性时， ref 回调接受底层的 DOM 元素作为参数。例如，下面的代码使用ref 回调来存储 DOM 节点的引用。

旧版API: String 类型的 Refs
如果你之前使用过 React ，你可能了解过之前的API中的 string 类型的 ref 属性。类似于 "textInput" ，可以通过 this.refs.textInput 访问DOM节点。我们不建议使用，因为string类型的 refs 存在问题。已经过时了，可能会在未来的版本是移除。如果你目前还在使用 this.refs.textInput 这种方式访问 refs ，我们建议用回调函数的方式代替。
