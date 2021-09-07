#!/usr/bin/env Python3

class Link:
    def __init__(self, data: str) -> None:
        self.data = data
        self.next = None

    def __str__(self) -> str:
        if self.next == None:
            return f"({self.data})"
        return f"({self.data})->{self.next}"


class Links:
    def __init__(self, count: int) -> None:
        self.header = Link("H")
        link = self.header

        w = len(f"{count}")
        for i in range(0, count):
            link.next = Link(f"L{i:0{w}}")
            link = link.next
        link.next = Link("T")

    def __str__(self) -> str:
        return f"Links:{self.header}"

    def revert(self):
        current_link = self.header
        next_link = current_link.next
        while next_link.next != None:

            new_current = next_link
            new_next = new_current.next

            next_link.next = current_link

            current_link = new_current
            next_link = new_next

        self.header.next = None
        self.header = next_link
        self.header.next = current_link


def main():
    links = Links(8)
    print(f"origin links:{links}")
    links.revert()
    print(f"revert links:{(links)}")


if __name__ == "__main__":
    main()
