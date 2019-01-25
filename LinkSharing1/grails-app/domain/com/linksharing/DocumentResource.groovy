package com.linksharing

class DocumentResource extends Resource {

    String fullPath
    String fileName



    static constraints = {
        fullPath blank: false,nullable: false
        fileName blank: false,nullable: false
    }
}
