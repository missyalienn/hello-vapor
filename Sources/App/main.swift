import Vapor



let drop = Droplet()

drop.get { request  in
    //return "Hello, Vapor!"
    return try JSON(node: [
        "message" : "Hello, world"
        
        ])
}

// at the url localhost8080:/hello
drop.get("hello") { request  in
    return try JSON(node: [
        "message" : "Hello, world! Hi, Again!"
        
        ])
}

//nest paths
drop.get("hello", "there") { request  in
    return try JSON(node: [
        "message" : "Ok, that's enough for now."
        
        ])
}

drop.get("beers", Int.self) { request, beers in
    return try JSON(node: [
        
        "message": "Take one down, pass it around. \(beers - 1) beers on the wall..."
        ])
    
}

drop.post("post")  { request in
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    return try JSON(node: [
        "message":"Hello, \(name)"
        ])
}

drop.get("people") { request in
 
    return try JSON(node:[
        
       "message": "hello people"
    
    ])
    
}









drop.run()













