--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import           Text.Pandoc
import           Data.Set as S
import           Data.Default


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "extracont/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "css/ie/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "js/*" $ do
        route idRoute
        compile copyFileCompiler

    match "fonts/*" $ do
        route idRoute
        compile copyFileCompiler

    {-
       match "index.markdown" $ do
           route idRoute
           compile $ do
               pages <- loadAll "pages/*"
               let indexCtx =
                       listField "pages" pagesCtx (return pages) `mappend`
                       constField "title" "Home"                `mappend`
                       defaultContext
               getResourceBody
                   >>= applyAsTemplate indexCtx
                   >>= loadAndApplyTemplate "templates/default.html" indexCtx
                   >>= relativizeUrls
    -}

    match "index.markdown" $ do
        route $ setExtension "html"
        compile $
            pandocCompiler
                >>= applyAsTemplate defaultContext
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls

    match "project/*.markdown" $ do
      route $ setExtension "html"
      compile $
        pandocCompiler
        >>= applyAsTemplate defaultContext
        >>= loadAndApplyTemplate "templates/nosidebar.html" defaultContext
        >>= relativizeUrls

    match "research.markdown" $ do
        route $ setExtension "html"
        compile $
            let ctx = constField "ex1" "images/parsuma.jpg"  `mappend`
                      constField "tesinapdf" "extracont/tesina.pdf"  `mappend`
                      defaultContext in
            pandocCompilerWith markdownReader def
                >>= return . fmap (demoteHeaders )
                >>= applyAsTemplate ctx
                >>= loadAndApplyTemplate "templates/nosidebar.html" ctx
                >>= relativizeUrls

    match "teaching.markdown" $ do
        route $ setExtension "html"
        compile $ do
            let
                ctx = constField "presentation" "extracont/presentation.tpp"  `mappend`
                        pagesCtx
            pandocCompiler
                >>= return . fmap demoteHeaders
                >>= applyAsTemplate ctx
                >>= loadAndApplyTemplate "templates/nosidebar.html" ctx
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler


--------------------------------------------------------------------------------
--
markdownReader :: ReaderOptions
markdownReader =  def {
            readerExtensions = multimarkdownExtensions
    }

markdownWriter :: WriterOptions
markdownWriter = def {
            writerExtensions = multimarkdownExtensions
    }

pagesCtx :: Context String
pagesCtx =
     defaultContext

postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext
