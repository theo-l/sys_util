
"jsf tag mappings
function! XhtmlJSFMapping()

    "JSF html tags
    inoremap <buffer> htable <h:dataTable value=""><C-J><C-J></h:dataTable><Esc>2k/value<C-J>f=l
    inoremap <buffer> hmsg <h:message /><Esc>F\ 
    inoremap <buffer> hmsgs <h:messages /><Esc>F\ 
    inoremap <buffer> hcol <h:column><C-J><C-J></h:column><Esc>ka
    inoremap <buffer> hcmdbt <h:commandButton value="" /><Esc>F=l
    inoremap <buffer> hcmdlk <h:commandLink value="" /><Esc>F=l
    inoremap <buffer> hfrm <h:form id=""/><C-J><C-J></h:form><Esc>ka
    inoremap <buffer> hintxt <h:inputText value=""/><Esc>F=l
    inoremap <buffer> houtxt <h:outputText value="" /><Esc>F=l
    inoremap <buffer> honemenu <h:selectOneMenu value=""><C-J><C-J></h:selectOneMenu><Esc>ka
    inoremap <buffer> hblbox <h:selectBooleanCheckbox value=""/><C-J><C-J></h:selectBooleanCheckbox><Esc>ka

    "JSF Core tags
endfunction


function! XhtmlJSFAbbrevs()

    iabbrev <buffer> hmessage hmsg
    iabbrev <buffer> hmessages hmsgs
    iabbrev <buffer> hcolumn hcol
    iabbrev <buffer> hdatatable htable
    iabbrev <buffer> hcommandbutton hcmdbt
    iabbrev <buffer> hcommandlink hcmdlk
    iabbrev <buffer> hselectonemenu honemenu
    iabbrev <buffer> hbooleanbox hblbox
    iabbrev <buffer> hform hfrm 
    iabbrev <buffer> houtputlink <h:outputLink id="" value="" />
    iabbrev <buffer> hpanelgrid <h:panelGrid id="" value="" />
    iabbrev <buffer> hpanelgroup <h:panelGroup id="" value="" />
    iabbrev <buffer> hselectoneradio <h:selectOneRadio id="" value="" />
    iabbrev <buffer> hselectonelistbox <h:selectOneListbox id="" value="" />
    iabbrev <buffer> hselectmanymenu    <h:selectManyMenu id="" value="" />
    iabbrev <buffer> hselectmanylistbox <h:selectManyListbox id="" value="" />
    

    "text components
    iabbrev <buffer> hinputtext hintxt
    iabbrev <buffer> houtputtext houtxt
    iabbrev <buffer> hinputhidden <h:inputHidden id="" value="" />
    iabbrev <buffer> hinputsecret <h:inputSecret id="" value="" />
    iabbrev <buffer> hinputtextarea <h:inputTextarea id="" value=" " />



    "JSF core tags
    iabbrev <buffer> factionlis <f:actionListener />
    iabbrev <buffer> fconverter <f:converter />
    iabbrev <buffer> fdateconverter <f:convertDateTime />
    iabbrev <buffer> fnumberconverter <f:convertNumber />
    iabbrev <buffer> facet <f:facet name=""> </f:facet><Esc>0f"
    iabbrev <buffer> fselectitem <f:selectItem />
    iabbrev <buffer> fselectitems <f:selectItems value="" /><Esc>0f"
    iabbrev <buffer> fvalidator <f:validator />
    iabbrev <buffer> fvalidatedoublerange <f:validateDoubleRange />
    iabbrev <buffer> fvalidatelength  <f:falidateLength />
    iabbrev <buffer> fvaluedatelongrange <f:validateLongRange />
    iabbrev <buffer> fvalidatebean <f:validateBean />
    iabbrev <buffer> fvaludaterequired <f:validateRequired />
    iabbrev <buffer> fparam <f:param name="" value= "" /><Esc>0f"
    iabbrev <buffer> fajax <f:ajax />

endfunction


"add comment line
function! XhtmlCommonMap()

   	inoremap <buffer> <c-_> <c-r>=XmlCommentToggle()<C-J>
   	nnoremap <buffer> <c-_> i<c-r>=XmlCommentToggle()<C-J><Esc>
   	vnoremap <buffer> <c-_> <Esc>i<c-r>=XmlVCommentToggle()<C-J><Esc>x
 
endfunction

"function to include all configuration for xhtml file
function! XhtmlCommonConfig()

    call XhtmlJSFMapping()
    call XhtmlJSFAbbrevs()
    call XhtmlCommonMap()
    
endfunction


