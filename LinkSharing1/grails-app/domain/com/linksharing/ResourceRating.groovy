package com.linksharing

class ResourceRating {

    Resource resource
    User user
    Integer score

    ResourceRating(Resource resource, User user, Integer score) {
        super()
        this.resource = resource
        this.user = user
        this.score = score
    }
    static belongsTo = [user:User]

    static constraints = {
        resource blank: false,nullable: false
        user blank: false,nullable: false
        score blank: false,nullable: false

    }
}
