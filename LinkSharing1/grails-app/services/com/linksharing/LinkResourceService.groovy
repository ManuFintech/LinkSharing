package com.linksharing

import grails.gorm.transactions.Transactional

@Transactional
class LinkResourceService {
    def springSecurityService

    def serviceMethod() {

    }

    def createLink(def link, def description, def topicId) {
        User user = springSecurityService.currentUser
        Topic topic = Topic.findById(topicId)
        println("sssssssssssssssssssssss" + link + " " + description + " " + topicId)
        LinkResource linkResource = new LinkResource()
        linkResource.url=(String)link
        linkResource.description=(String)description
        linkResource.createdBy=user
        linkResource.topic=topic

        if(!linkResource.save(flush:true)){
            linkResource.errors.allErrors.each {
                println(it)
            }
        }else{
            println("Success")
        }

        return Resource.list()



    }
}
