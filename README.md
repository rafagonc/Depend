# Depend
  
Depend is a simple dependency injection framework to do the simplest and minimally invasive property injection. It just works with Protocol bindings since it is the right thing to do! And it’s pretty simple:  


## The Installation
  
You can install using cocoa pods:  
<pre>pod ‘Depend'</pre>  

Or, you can drop the files inside Pod/Classes into your project.

## The Registration
  
Just provide the DPRegistry the implementation for the protocol:  
<pre>[[DPRegistry sharedRegistry] registerImplementation:[DPDatasource class] forProtocol:@protocol(DPDatasourceProtocol) context:nil];</pre>  
The implementation works this way:  
**If you provide a class**: The injection class will instantiate for you with the default constructor   **If you provide an instance**: The instance will be injected!  


## The Injection

On the app delegate, you need to call the DPInjector inject method:
<pre>-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [DPInjector inject];
    return YES;
}
</pre>
  
To inject on a class you just need to write your property declaration with the 'injected' prefix to the setter and the readonly qualifier. It’s important to declare it on the private interface of your class.  
<pre>@property (setter=injected:, readonly) id&lt;DPDatasourceProtocol&gt; datasource;</pre>  
Done! When you access **self.datasource **, it is going to be already populated.  


## Contexts
  
For you who wondered what is the context parameter on the DPRegistry registerImplementation:forProtocol:context: method. Defining a context on the injection and in the registration can be used to provide different implementations.  
Just change the injection declaration to:  
<pre>@property (setter=injected_post:, readonly) id&lt;DPDatasourceProtocol&gt; postDatasource;  
@property (setter=injected_stupid:, readonly) id&lt;DPDatasourceProtocol&gt; anotherStupidDatasource;</pre>  
And the registration to:  
<pre>[[DPRegistry sharedRegistry] registerImplementation:[DPPostDatasource class] forProtocol:@protocol(DPDatasourceProtocol) context:@“post”];
[[DPRegistry sharedRegistry] registerImplementation:[DPStupidDatasource class] forProtocol:@protocol(DPDatasourceProtocol) context:@“stupid”];</pre>  
Any word that comes after the _ (underline) is the context name.  


## License
  
The MIT License (MIT)
Copyright (c) 2015 Rafael Gonçalves  
Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:  
The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.  
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER  
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  
SOFTWARE.
