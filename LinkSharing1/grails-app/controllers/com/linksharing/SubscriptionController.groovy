package com.linksharing

import grails.plugin.springsecurity.annotation.Secured

class SubscriptionController {

    def subscriptionService

    def index() { }

    @Secured('permitAll')
    def  addSubscription(){
        def id=params.value
        String returnedValue=subscriptionService.subscribe(id)
        render  returnedValue
    }

    def getSubscription(Integer id){
        render subscriptionService.subscriber(id)
    }

    def getSubscriptions(){
        render subscriptionService.allSubscription()
    }

    def updateSubscriptions(){

    }

    def deleteSubscriptions(Integer id){
        subscriptionService.deleteSubscription(id)
    }
}
