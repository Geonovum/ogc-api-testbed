<#setting locale="en_US">
<!DOCTYPE html>
<html lang="en">
  <head>
      <#if pagetitle?? && pagetitle?has_content>
        <title>${pagetitle}</title> 
      <#elseif model?? && model.htmlTitle?has_content>
        <title>${model.htmlTitle}</title>
      </#if>
      <link rel="stylesheet" href="${resourceLink("apicss/bootstrap.min.css")}" type="text/css" media="all" />
      <link rel="stylesheet" href="${resourceLink("apicss/geoserver.css")}" type="text/css" media="all" />
      <style>
        header a {
            height: 4.7rem;
            width: 8.2rem;
            margin: 10px;
            background: url(https://www.geonovum.nl/logo.svg) no-repeat;
        }
        header, .region-footer {
            border-bottom: 1px solid rgba(94,94,94,.2)
        }
        body {
          color: #5e5e5e;
          font-family: "Open Sans",sans-serif;
          font-size: 1rem;
          line-height: 1.5rem;
        }
        .region-footer {
          position: relative;
          margin-top: 6rem;
          padding-bottom: 6rem;
          padding-top: 3rem;
        }
      </style>
  </head>
<body>
  <header id="header" class="container">
  <div class="row">
    <div class="col-md-2"><a href="${serviceLink("")}"></a></div>
    <div class="col-md-10">Verkent, verbindt, verankert</div>
  </div>
  </header>
  <#if pagecrumbs??>
  <div id="breadcrumb" class="py-2 mb-4">
    <div class="container">
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb mb-0">
          ${pagecrumbs}
        </ol>
      </nav>
    </div>
  </div>
  </#if>
  <main>
    <div id="content" class="container">
