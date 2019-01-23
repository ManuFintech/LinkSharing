package com.linksharing

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class SubscriptionController {

    def subscriptionService

    def index() { }

    @Secured('permitAll')
    def  addSubscription(){
        println("??????????????????"+params.param1+" "+params.param2+" "+params.param3)
        def a=params.param1
        Enums.Seriousness seriousness=(Enums.Seriousness)params.param2
        Subscription subscription=(Subscription)subscriptionService.subscribe(a,seriousness)
//        String content=g.render([template: "/topicController/unsubscribe", model: [id: params.param1, buttonvalue: params.param3]])
//        println("[[[[[[[[[[[[[[[[[[[[["+content)
//        Map responseData=[content: content]
//        render(responseData as JSON)
        String content=g.render(template: "/topicController/unsubscribe",model: [count:1,subscribedTopic: subscription])
        println("ccccccccccccccccccccccccc"+content)
        Map responseData=[content: content]
        render(responseData as JSON)
    }

    def getSubscription(Integer id){
        render subscriptionService.subscriber(id)
    }

    def getSubscriptions(){
        render subscriptionService.allSubscription()
    }

    def updateSubscriptions(){

    }

    @Secured('permitAll')
    def deleteSubscriptions(){
        println(":::::::::::::::::::::::::"+params.param1)
        def id=params.param1
        subscriptionService.deleteSubscription(id)


    }


}
