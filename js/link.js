#!/usr/bin/env node

class Link {
    constructor(data, next) {
        this.data = data
        this.next = next
    }

    toString = () => {
        if (this.next == null) {
            return "(" + this.data + ")"
        }
        return "(" + this.data + ")->" + this.next;
    }
}

class Links {
    header = new Link("H", null)
    toString = () => {
        return this.header.toString();
    }

    constructor(count) {
        var current = this.header
        let width = ("" + count).length
        for (var i = 0; i < count; i++) {
            current.next = new Link(`L${("" + i).padStart(width, 0)}`);
            current = current.next;
        }
        current.next = new Link("T", null);
    }

    revert = () => {
        var current_link = this.header;
        var next_link = current_link;
        while (next_link.next != null) {
            var new_current = next_link
            var new_next = new_current.next

            next_link.next = current_link

            current_link = new_current
            next_link = new_next
        }

        this.header.next = null;
        this.header = next_link;
        this.header.next = current_link;
    }

}


var links = new Links(8)
console.log("origin links:" + links);
links.revert();
console.log("revert links:" + links);