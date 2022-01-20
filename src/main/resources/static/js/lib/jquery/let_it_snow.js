jQuery(document).ready(function($){
    $(document).snowFlurry({
        maxSize: 100,
        numberOfFlakes: 100,
        minSpeed: 10,
        maxSpeed: 50,
        color: 'white',
        timeout: 0
    });
});