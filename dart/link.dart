#!/usr/bin/env dart

class Link{
    String data = "";
    Link? next;
    Link(this.data, this.next);

    String toString(){
        if (next == null){
            return "(${data})";
        }
        return "(${data})->${next}";
    }
}

class Links{
    Link header = Link("H", null);

    Links(int count){
        var current = this.header;
        var width = "${count}".length;
        for (var i = 0 ; i < count ; i++){
            current.next = Link("L${i.toString().padLeft(width, '0')}",null);
            current = current.next!;
        }
        current.next = Link("T", null);
    }

    String toString(){
        return "${header}";
    }

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

void main(List<String> arguments){
    var links = Links(8);
    print("origin links:$links");
    links.revert();
    print("revert links:$links");
}

