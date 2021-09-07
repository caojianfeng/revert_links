import java.lang.System;

public class Links {
    class Link {
        String data;
        Link next;

        Link(String data, Link next) {
            this.data = data;
            this.next = next;
        }

        @Override
        public String toString() {
            if (next == null) {
                return "(" + data + ")";
            }
            return "(" + data + ")->" + next;
        }
    }

    Link header = new Link("H", null);

    Links(int count) {
        Link current = header;
        int width = ("" + count).length();
        for (int i = 0; i < count; i++) {
            current.next = new Link(String.format("L%0" + width + "d", i), null);
            current = current.next;
        }
        current.next = new Link("T", null);
    }

    void revert() {
        Link current_link = this.header;
        Link next_link = current_link;
        while (next_link.next != null) {
            Link new_current = next_link;
            Link new_next = new_current.next;

            next_link.next = current_link;

            current_link = new_current;
            next_link = new_next;
        }
        this.header.next = null;
        this.header = next_link;
        this.header.next = current_link;
    }

    @Override
    public String toString() {
        return header.toString();
    }

    public static void main(String[] args) {
        Links links = new Links(8);
        System.out.println("origin links:" + links);
        links.revert();
        System.out.println("revert links:" + links);
    }
}
