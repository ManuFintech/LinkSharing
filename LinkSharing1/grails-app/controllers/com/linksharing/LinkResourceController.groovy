package com.linksharing

import grails.plugin.springsecurity.annotation.Secured

class LinkResourceController {
    def linkResourceService

    @Secured("permitAll")
    def index() {
        render(view: "/linkResourceController/shareLink")
    }

    @Secured('permitAll')
    def saveLink(){
        println("ssssssssssssssssssssslllllllllllllllll"+params.link+" "+params.description+" "+params.topicID)
        List list=linkResourceService.createLink(params.link,params.description,params.topicID)
        render(view: "/userSetupController/homePage",model: [list:list])
    }
}
