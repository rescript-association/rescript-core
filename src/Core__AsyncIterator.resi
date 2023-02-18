/***
Bindings to async iterators, a way to do async iteration in JavaScript.

See [async iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) on MDN.*/

/**
The type representing an async iterator.
*/
type t<'a>

type value<'a> = {
  /**
  Whether there are more values to iterate on before the iterator is done.
  */
  done: bool,
  /**
  The value of this iteration, if any.
  */
  value: option<'a>,
}

/**
`next(asyncIterator)`

Returns the next value of the iterator, if any.

See [async iterator protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) on MDN.

## Examples
- A simple example, getting the next value:
```rescript
let {done, value} = await someAsyncIterator->AsyncIterator.next
```

- Complete example, including looping over all values:
```rescript
// Let's pretend we get an async iterator returning ints from somewhere.
@val external asyncIterator: AsyncIterator.t<int> = "someAsyncIterator"


let processMyAsyncIterator = async () => {
  // ReScript doesn't have `for ... of` loops, but it's easy to mimic using a while loop.
  let break = ref(false)

  while !break.contents {
    // Await the next iterator value
    let {value, done} = await asyncIterator->AsyncIterator.next

    // Exit the while loop if the iterator says it's done
    break := done

    // This will log the (int) value of the current async iteration, if a value was returned.
    Console.log(value)
  }
}
```
*/
@send
external next: t<'a> => promise<value<'a>> = "next"
