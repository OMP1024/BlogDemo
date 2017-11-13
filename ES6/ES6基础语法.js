一、 定义变量
let a = 1;
var b = 2;
const c = 3;

对比：

let 声明的变量：
1> 只在所在的代码块可访问
{
	let a = 2;
}
a;  // 只能所在代码块内使用

2> 不存在“变量提升”，即：不能在声明之前使用

a = 2;  // 是错误的，不存在变量提升
let a = 1;

3> 暂时性死区
var temp = 'aa';
{
	temp = 'bb';  // temp is not defined
	// 很好理解，let temp 是局域变量，优先级高于全局变量，let 变量不存在变量提升
	// let 变量屏蔽的外界的变量，只看代码块中的变量使用即可
	let temp = 'cc';
}

4> 不允许重复声明一个变量
{
	let a = 1;
	// 不行的
	let a = 3;
}

var 声明的变量：
1> 存在变量提升
var temp = 'a';
{
	console.log(temp); // 输出为 und
	var temp = 'b';
}
2> 可以重复声明一个变量

const 定义的变量：
1> 和 let 声明变量一样的特性完全一样
2> 定义变量必须直接赋值，且不能修改。

小结：编程中尽可能使用 let const 定义变量。避免 var 的一些诡异的特性。


二、字符串模板
var name = 'Bob';
// ES5,字符串拼接
console.log("hello" + name)
// ES6，字符串模板
console.log(`hello ${name}`)


三、箭头函数
1、单个参数
// ES5
var sayHello = function(name) {
    		return 'Hello ' + name + '!';
		};
// ES6
var sayHello1 = name => `hello ${name}`;

2、多个参数
var greet = (greeting,name) => {
	return `${greeting} ${name}`;
};

var greet = (greeting,name) => `${greeting} ${name}`;

带大括号的要有 return 返回。


四、顶层变量
顶层变量：浏览器中是指 window，Node 中是指 global.
ES6中 var function声明的全局变量默认也是顶层变量的属性。


五、解构赋值
1、数组解构赋值
let [a,b,c] = [1,2,3];

1> 默认值
默认值是当解构出来的值是 undefined的就取默认值。
let [x = 1,y = 2] = [2,3]
x = 2,y = 3

2、对象解构赋值
// 属性和变量值一样的情况
let { foo, bar } = { foo: "aaa", bar: "bbb" };
foo // "aaa"
bar // "bbb"

// 属性和变量值不一样的情况
let{foo:baz} = {foo:"aaa"}
baz // "aaa"

可以利用这个特性，从函数中返回多个值，然后进行对象的解析。


六、for of 
var array = [12,3,45,5,6]
for(let index of array){
	if (index === 45) {break;}
	console.log(index)
}

七、类
class Person{
	// 类的构造函数
	constructor(name){
		this.name = name;
		console.log(`this person'name is ${this.name}`);
	}
	// 类的函数
	sayHello(){
		console.log('hello world');
	}

	// this默认是指向类的实例的，但是单独使用的话，this 是指向这个函数所在的运行环境
	// 解决方法1：在构造函数中绑定这个函数 this.printName = this.printName.bind(this)
	// 解决方法2：箭头函数中的 this默认是绑定了
	printName(){
		this.print(`this name is ${this.name}`);
	}

	print(text){
		console.log(text);
	}
}

八、Symbol 是一种新的原始数据类型
Symbol 可以用来创建一个应用程序中独一无二的字符串。保证与应用的其他变量，属性冲突。

const COLOR_RED = Symbol(); 
const COLOR_ORANGE = Symbol();
