import axios from 'axios'
import { Controller } from "stimulus"

export default class extends Controller {
    
    static targets = [ "likeCounter" ]
    
    addLike(event){

        event.preventDefault();
        let slug = event.currentTarget.dataset.slug

        axios.post(`/stories/${slug}/like`)
                
                .then(function(response){
                    let status = response.data.status
                    console.log(status)
                })

                .catch(function(error){
                    console.log("error")
                })    
    }
    
}