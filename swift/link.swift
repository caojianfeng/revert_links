import Foundation

class Link: NSObject{
    var data: String
    var next: Link?
    
    override var description: String {
        guard let next = self.next else{
            return "(\(data))"
        }
        return "(\(data))->\(next)"
    }

    init(_ data: String, _ next: Link?){
        self.data = data
        self.next = next
    }
}

class Links: NSObject{
    var header:Link
    override var description: String {
        return "\(header)"
    }
    
    init(_ count: Int){
        var current = Link("H",nil)
        self.header = current
        super.init()
        
        let w = String(format:"%d", count).count
        
        for i in 0..<count {
            current.next = Link(String(format:"L%0\(w)d}", i), nil)
            current = current.next!
        }
        
        current.next = Link("T", nil)
    }

    func revert(){
        var current_link = self.header
        var next_link = current_link.next
        while next_link!.next != nil{
            let new_current = next_link
            let new_next = new_current!.next
            
            next_link!.next = current_link
            
            current_link = new_current!
            next_link = new_next
        }
        
        self.header.next = nil
        self.header = next_link!
        self.header.next = current_link
    }
}

var links = Links(8)
print("origin links:\(links)")
links.revert()
print("revert links:\(links)")
