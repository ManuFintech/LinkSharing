package com.linksharing


import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartFile


class DocumentResourceController {
    def documentResourceService


    @Secured('permitAll')
    def index() {
        render(view: "/documentResourceController/upload")
    }


    @Secured('permitAll')
    def upload() {

       String str= documentResourceService.uploadDocument(params.file,params.description,params.topicID)
        render str


//        String content=request.getContentType()
//        println("Ccccccccccccccccccccccc"+content)
//        MultipartFile file=params.file
//        println("+pppppppppppppppppppppppppp"+params.file+" "+params.description+" "+params.topicID)
//        println("ffffffffffffffffffffffffff"+file)
//        if(file.empty) {
//            flash.message = "File cannot be empty"
//        } else {
//            def documentInstance = new DocumentResource()
//            documentInstance.fileName = file.originalFilename
//            println("uuuuuuuuuuuuuuuuuuuuu"+grailsApplication.config.uploadFolder)
//            documentInstance.fullPath = grailsApplication.config.uploadFolder + documentInstance.fileName
//            file.transferTo(new File(documentInstance.fullPath))
//            if(!documentInstance.save(flush: true)){
//                documentInstance.errors.allErrors.each {
//                    println it
//                }
//            }else
//                println "Success"
//        }
//        render "Success"
   }
}
