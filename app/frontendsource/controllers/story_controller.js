import axios from 'axios'
import { Controller } from "stimulus"

export default class extends Controller {
    
    static targets = [ "likeCounter" ]
    
    addLike(event){

        event.preventDefault();
        let slug = event.currentTarget.dataset.slug
        let target = this.likeCounterTarget
        //console.log(target)

        axios.post(`/api/stories/${slug}/like`)
                
                .then(function(response){
                    let status = response.data.status
                    
                    switch(status) {
                        case "請先登入":
                            alert("請先登入！")
                            break
                        default:
                            console.log(status)
                            target.innerHTML = status;
                    }
                })

                .catch(function(error){
                    console.log("error")
                })    
    }
    
}