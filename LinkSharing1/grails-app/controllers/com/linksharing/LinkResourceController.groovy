package com.linksharing

import grails.plugin.springsecurity.annotation.Secured

class LinkResourceController {

    @Secured("permitAll")
    def index() {
        render(view: "/linkResourceController/shareLink")
    }
}
