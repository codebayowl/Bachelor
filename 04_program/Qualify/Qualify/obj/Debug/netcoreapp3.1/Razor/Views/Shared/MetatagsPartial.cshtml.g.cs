#pragma checksum "D:\NURE\Bachelor\04_program\Qualify\Qualify\Views\Shared\MetatagsPartial.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "6f542c1fc9f4ee735e387ffd7be325b9ea475159"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Shared_MetatagsPartial), @"mvc.1.0.view", @"/Views/Shared/MetatagsPartial.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "D:\NURE\Bachelor\04_program\Qualify\Qualify\Views\Shared\MetatagsPartial.cshtml"
using Qualify.Service;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"6f542c1fc9f4ee735e387ffd7be325b9ea475159", @"/Views/Shared/MetatagsPartial.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"a9af4978b9c2bfca24ef48e96efe5f8573634464", @"/Views/_ViewImports.cshtml")]
    public class Views_Shared_MetatagsPartial : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("<meta charset=\"UTF-8\">\r\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n<title>");
#nullable restore
#line 5 "D:\NURE\Bachelor\04_program\Qualify\Qualify\Views\Shared\MetatagsPartial.cshtml"
  Write(ViewData["Title"]);

#line default
#line hidden
#nullable disable
            WriteLiteral(" | ");
#nullable restore
#line 5 "D:\NURE\Bachelor\04_program\Qualify\Qualify\Views\Shared\MetatagsPartial.cshtml"
                       Write(Config.CompanyName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</title>");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
