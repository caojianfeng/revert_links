面试官：用你会的语言写个链表逆序算法

我：请多给我一些时间😳😓


运行结果：
```txt
origin links:(H)->(L0)->(L1)->(L2)->(L3)->(L4)->(L5)->(L6)->(L7)->(T)
revert links:(T)->(L7)->(L6)->(L5)->(L4)->(L3)->(L2)->(L1)->(L0)->(H)
```

### java
执行：
```bash
java/run.sh
```
### js

执行：
```bash
node js/link.js
```
或者
```bash
js/link.js
```

⚠️注意 1：安装完node才能执行

⚠️注意 2：在你的js里面添加这个文件头后，你才能直接执行这个js文件
```
#!/usr/bin/env node
```

### dart

执行：
```bash
dart dart/link.dart
```
或者
```bash
dart/link.dart
```

⚠️注意 1：需要确保你已经安装好dart环境，你可以运行 dart --version 检验一下。

⚠️注意 2：在你的js里面添加这个文件头后，你才能直接执行这个js文件
```
#!/usr/bin/env dart
```

你也可以先编译再运行
```bash
dart compile exe link.dart -o test_link
./test_link
```

### kotlin

执行：
```bash
kotlin/run.sh
```


有趣的是在revert函数内部，两者的语句非常相似，仅仅差句尾的分号

kotlin:
```kotlin
//...

class Links(count: Int){
    //...
    fun revert(){
        var current_link = this.header
        var next_link = current_link
        while (next_link.next != null){
            var new_current = next_link
            var new_next = new_current.next

            next_link.next = current_link

            current_link = new_current
            next_link = new_next!!
        }
        this.header.next = null
        this.header = next_link
        this.header.next = current_link
    }
}

//...
```

dart:
```dart
//...
class Links{
    // ...
    void revert(){
        var current_link = this.header;
        var next_link = current_link;
        while (next_link.next != null){
            var new_current = next_link;
            var new_next = new_current.next;

            next_link.next = current_link;

            current_link = new_current;
            next_link = new_next!;
        }
        this.header.next = null;
        this.header = next_link;
        this.header.next = current_link;
    }
}
// ...
```

### python


执行：
```bash
python3 python/link.py
```
或者
```bash
python/link.py
```

### swift

执行：
```bash
swift/run.sh
```
或者
```bash
swift swift/link.swift 
```
⚠️注意 1：需要确保你已经安装好dart环境，你可以运行 dart --version 检验一下。

⚠️注意 2：在你的js里面添加这个文件头后，你才能直接执行这个js文件

在 link.swift 第一行插入
```
#!/usr/bin/env swift
```
之后你就可以直接这样调用了
```bash
swift/link.swift 
```

## 执行方式

语言 | 解释执行 | 编译执行
----|----|----
java| ❌ |✅ 
js| ✅ |❌
dart |✅| ✅
kotlin| ❌ |✅ 
python|✅| ❌ 
swift|✅| ✅

## 脚本执行的时候自动匹配执行者

在你的文件中
#!/usr/bin/env node