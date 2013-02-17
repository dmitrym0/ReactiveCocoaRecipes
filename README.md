ReactiveCocoaRecipes
====================

# Summary

My attempt to understand the [ReactiveCocoa Framework](https://github.com/ReactiveCocoa) by trying simple things.

**First** look at [RACRAsynchronousEventGenerator.h](ReactiveCocoaRecipes/ReactiveCocoaRecipes/RACRAsynchronousEventGenerator.h). It's a dummy event generator similar in style to a AFNetworking request style. It has a intermediate block, a success block and an error block. The intermediate block (next) gets executed with a value while the event is "in progress". Once the event is complete, the complete handler is called.

**Second** look at [RACRSynchronizeTwoAsyncOperations.m](ReactiveCocoaRecipes/ReactiveCocoaRecipes/RACRSynchronizeTwoAsyncOperations.m). A frequent scenario is when two asynchronous requests need to be synchronized. This scenario demoes that.
