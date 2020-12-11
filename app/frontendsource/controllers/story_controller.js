import axios from 'axios'
import { Controller } from "stimulus"

export default class extends Controller {
    
    static targets = [ "likeCounter" ]
    
    addLike(event){

        event.preventDefault();
        //this.likeCounterTarget.innerHTML = 5;

        let slug = event.currentTarget.dataset.slug
        //console.log(slug);

        axios.post(`/stories/${slug}/like`)
                
                .then(function(response){
                    
                    let status = response.data.status
                    console.log(status)
                    console.log(document.querySelector(".likeCounter").innerHTML)
                    //<span class= "likeCounter" data-target="story.likeCounter">0</span>
                    switch(status){
                        case "請先登入":
                            alert ("請先登入！")
                            break
                        // default:
                        //     this.likeCountertargets = "5";
                    }

                })

                .catch(function(error){
                    console.log("error")
                })    
    }
    
}