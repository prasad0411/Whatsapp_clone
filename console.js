const funfunfun = arr =>{
  let dummy = []
  for(i=0;i<arr.length;i++){
    
    if (typeof arr[i]=='number'){
      dummy.push(arr[i])
    }
  }
  console.log(dummy)
}
funfunfun([1,2,3,"4",5])
