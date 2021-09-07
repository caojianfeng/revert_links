面试官：用你会的语言写个链表逆序算法

我：请多给我一些时间😳😓


运行结果：
```txt
origin links:(H)->(L0)->(L1)->(L2)->(L3)->(L4)->(L5)->(L6)->(L7)->(T)
revert links:(T)->(L7)->(L6)->(L5)->(L4)->(L3)->(L2)->(L1)->(L0)->(H)
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

需要确保你已经安装好dart环境，你可以运行 dart --version 检验一下。


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


## 执行方式

语言 | 解释执行 | 编译执行
----|----|----
dart |✅| ✅
kotlin| ❌ |✅ 
python|✅| ❌ 
swift|✅| ✅
