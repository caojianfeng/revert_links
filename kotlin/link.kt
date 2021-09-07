class Link(data: String, next: Link?){
    var data:String = data
    var next:Link? = next

    override fun toString(): String{
        if(this.next == null){
            return  "(${data})"
        }
        return "(${data})->${next}"
    }
}

class Links(count: Int){
    var header: Link = Link("H",null)
    init{
        var current: Link? = header
        var w = "${count}".length
        for(i in 0..count){
            current!!.next = Link(String.format("L%0${w}d",i), null)
            current = current.next
        }
        current!!.next = Link("T", null)
    }

    override fun toString(): String{
        return "${this.header}"
    }

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

fun main(){
    var links = Links(8)
    println("origin links:$links")
    links.revert()
    println("revert links:$links")
}