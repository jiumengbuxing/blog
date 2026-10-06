---
title: "Markdown 扩展功能"
published: 2024-05-01
updated: 2024-11-29
description: "了解 Fuwari 提供的更多 Markdown 扩展特性"
image: ''
tags: ["演示", "示例", "Markdown", "Fuwari"]
category: "示例"
draft: false
---

## GitHub 仓库卡片

你可以添加指向 GitHub 仓库的动态卡片，页面加载时会通过 GitHub API 拉取仓库信息。

::github{repo="Fabrizz/MMM-OnSpotify"}

使用代码 `::github{repo="<owner>/<repo>"}` 即可创建 GitHub 仓库卡片。

```markdown
::github{repo="saicaca/fuwari"}
```

## 提示块（Admonitions）

支持以下类型的提示块：`note`（提示） `tip`（技巧） `important`（重要） `warning`（警告） `caution`（注意）

:::note
值得用户留意的信息，即使只是快速浏览也不应错过。
:::

:::tip
帮助用户更好地完成任务的附加信息。
:::

:::important
用户必须了解的关键信息。
:::

:::warning
存在潜在风险、需要用户立即关注的重要内容。
:::

:::caution
某个操作可能带来的负面后果。
:::

### 基本语法

```markdown
:::note
值得用户留意的信息，即使只是快速浏览也不应错过。
:::

:::tip
帮助用户更好地完成任务的附加信息。
:::
```

### 自定义标题

提示块的标题可以自定义。

:::note[我的自定义标题]
这是一条带自定义标题的提示。
:::

```markdown
:::note[我的自定义标题]
这是一条带自定义标题的提示。
:::
```

### GitHub 语法

> [!TIP]
> [GitHub 的提示块语法](https://github.com/orgs/community/discussions/16925)同样受支持。

```
> [!NOTE]
> GitHub 的提示块语法同样受支持。

> [!TIP]
> GitHub 的提示块语法同样受支持。
```

### 阅读遮罩（剧透）

你可以给文字添加遮罩效果，遮罩内的内容同样支持 **Markdown** 语法。

内容 :spoiler[被隐藏**起来**了]！

```markdown
内容 :spoiler[被隐藏**起来**了]！
```
