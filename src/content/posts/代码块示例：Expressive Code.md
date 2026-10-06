---
title: "代码块示例：Expressive Code"
published: 2024-04-10
description: "Fuwari 中代码块（Expressive Code）的各类写法与效果。"
tags: ["Markdown", "博客", "演示"]
category: "示例"
draft: false
---

本文展示 [Expressive Code](https://expressive-code.com/) 渲染代码块的各种效果。示例来自官方文档，更多细节可前往查阅。

## Expressive Code

### 语法高亮

[语法高亮](https://expressive-code.com/key-features/syntax-highlighting/)

#### 普通语法高亮

```js
console.log('这段代码有语法高亮！')
```

#### 渲染 ANSI 转义序列

```ansi
ANSI 颜色：
- 普通：[31m红[0m [32m绿[0m [33m黄[0m [34m蓝[0m [35m品红[0m [36m青[0m
- 加粗：  [1;31m红[0m [1;32m绿[0m [1;33m黄[0m [1;34m蓝[0m [1;35m品红[0m [1;36m青[0m
- 暗淡：  [2;31m红[0m [2;32m绿[0m [2;33m黄[0m [2;34m蓝[0m [2;35m品红[0m [2;36m青[0m

256 色（显示第 160-177 号颜色）：
[38;5;160m160 [38;5;161m161 [38;5;162m162 [38;5;163m163 [38;5;164m164 [38;5;165m165[0m
[38;5;166m166 [38;5;167m167 [38;5;168m168 [38;5;169m169 [38;5;170m170 [38;5;171m171[0m
[38;5;172m172 [38;5;173m173 [38;5;174m174 [38;5;175m175 [38;5;176m176 [38;5;177m177[0m

全 RGB 颜色：
[38;2;34;139;34mForestGreen - RGB(34, 139, 34)[0m

文字样式：[1m加粗[0m [2m暗淡[0m [3m斜体[0m [4m下划线[0m
```

### 编辑器与终端外框

[编辑器与终端外框](https://expressive-code.com/key-features/frames/)

#### 代码编辑器外框

```js title="my-test-file.js"
console.log('title 属性示例')
```

---

```html
<!-- src/content/index.html -->
<div>用文件名注释标名的示例</div>
```

#### 终端外框

```bash
echo "这个终端外框没有标题"
```

---

```powershell title="PowerShell 终端示例"
Write-Output "这个有标题！"
```

#### 覆盖外框类型

```sh frame="none"
echo "看，没有外框！"
```

---

```ps frame="code" title="PowerShell Profile.ps1"
# 不加覆盖的话，这会是一个终端外框
function Watch-Tail { Get-Content -Tail 20 -Wait $args }
New-Alias tail Watch-Tail
```

### 文本与行标记

[文本与行标记](https://expressive-code.com/key-features/text-markers/)

#### 标记整行与行区间

```js {1, 4, 7-8}
// 第 1 行 —— 按行号标记
// 第 2 行
// 第 3 行
// 第 4 行 —— 按行号标记
// 第 5 行
// 第 6 行
// 第 7 行 —— 按区间 "7-8" 标记
// 第 8 行 —— 按区间 "7-8" 标记
```

#### 选择行标记类型（mark、ins、del）

```js title="line-markers.js" del={2} ins={3-4} {6}
function demo() {
  console.log('这一行被标记为删除')
  // 这一行和下一行被标记为插入
  console.log('这是第二条插入的行')

  return '这一行使用中性的默认标记类型'
}
```

#### 给行标记添加标签

```jsx {"1":5} del={"2":7-8} ins={"3":10-12}
// labeled-line-markers.jsx
<button
  role="button"
  {...props}
  value={value}
  className={buttonClassName}
  disabled={disabled}
  active={active}
>
  {children &&
    !active &&
    (typeof children === 'string' ? <span>{children}</span> : children)}
</button>
```

#### 使用类 diff 语法

```diff
+这一行会被标记为插入
-这一行会被标记为删除
这是一个普通行
```

---

```diff
--- a/README.md
+++ b/README.md
@@ -1,3 +1,4 @@
+这是一个真正的 diff 文件
-所有内容保持原样
空白字符也不会被移除
```

#### 语法高亮与类 diff 语法结合

```diff lang="js"
  function thisIsJavaScript() {
    // 整个代码块会按 JavaScript 高亮，
    // 同时还能添加 diff 标记！
-   console.log('要移除的旧代码')
+   console.log('崭新闪亮的新代码！')
  }
```

#### 标记行内的特定文本

```js "给定文本"
function demo() {
  // 标记行内任意指定文本
  return '支持同一文本的多处匹配';
}
```

#### 正则表达式

```ts /ye[sp]/
console.log('yes 和 yep 这两个词会被标记。')
```

#### 转义斜杠

```sh /\/ho.*\//
echo "Test" > /home/test.txt
```

#### 选择行内标记类型（mark、ins、del）

```js "return true;" ins="插入" del="删除"
function demo() {
  console.log('这些是插入和删除标记类型');
  // return 语句使用默认标记类型
  return true;
}
```

### 自动换行

[自动换行](https://expressive-code.com/key-features/word-wrap/)

#### 按代码块配置换行

```js wrap
// 开启换行的示例
function getLongString() {
  return '这是一个非常长的字符串，除非容器特别宽，否则大概率放不下'
}
```

---

```js wrap=false
// wrap=false 的示例
function getLongString() {
  return '这是一个非常长的字符串，除非容器特别宽，否则大概率放不下'
}
```

#### 配置换行行的缩进

```js wrap preserveIndent
// preserveIndent 示例（默认开启）
function getLongString() {
  return '这是一个非常长的字符串，除非容器特别宽，否则大概率放不下'
}
```

---

```js wrap preserveIndent=false
// preserveIndent=false 的示例
function getLongString() {
  return '这是一个非常长的字符串，除非容器特别宽，否则大概率放不下'
}
```

## 折叠区块

[折叠区块](https://expressive-code.com/plugins/collapsible-sections/)

```js collapse={1-5, 12-14, 21-24}
// 这一大段样板代码会被折叠
import { someBoilerplateEngine } from '@example/some-boilerplate'
import { evenMoreBoilerplate } from '@example/even-more-boilerplate'

const engine = someBoilerplateEngine(evenMoreBoilerplate())

// 这部分代码默认可见
engine.doSomething(1, 2, 3, calcFn)

function calcFn() {
  // 可以有多个折叠区块
  const a = 1
  const b = 2
  const c = a + b

  // 这部分保持可见
  console.log(`计算结果：${a} + ${b} = ${c}`)
  return c
}

// 从这里到代码块结尾的内容会再次折叠
engine.closeConnection()
engine.freeMemory()
engine.shutdown({ reason: '示例样板代码结束' })
```

## 行号

[行号](https://expressive-code.com/plugins/line-numbers/)

### 按代码块显示行号

```js showLineNumbers
// 这个代码块会显示行号
console.log('来自第 2 行的问候！')
console.log('我在第 3 行')
```

---

```js showLineNumbers=false
// 这个代码块关闭了行号
console.log('喂？')
console.log('抱歉，你知道我在第几行吗？')
```

### 修改起始行号

```js showLineNumbers startLineNumber=5
console.log('来自第 5 行的问候！')
console.log('我在第 6 行')
```
