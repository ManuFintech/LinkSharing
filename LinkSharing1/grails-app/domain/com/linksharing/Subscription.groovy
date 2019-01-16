package com.linksharing

import Enums.Seriousness

class Subscription {

    Topic topic
    User user
    Seriousness seriousness
    Date dateCreated

    Subscription(Topic topic, User user, Seriousness seriousness) {
        super()
        this.topic = topic
        this.user = user
        this.seriousness = seriousness

    }
    static belongsTo = [user:User, topic:Topic]


    static constraints = {
        topic blank: true, nullable: true
        user blank: true, nullable: true
        seriousness blank: true, nullable: true

    }
}
