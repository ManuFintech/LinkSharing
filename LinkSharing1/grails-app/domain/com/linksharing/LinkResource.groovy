package com.linksharing

class LinkResource extends Resource{

    String url



    static constraints = {
        description blank: false,nullable: true
        createdBy blank: false,nullable: true
        topic blank: false, nullable: true
        dateCreated nullable: true
        lastUpdated nullable: true
        url url: true

    }
}
