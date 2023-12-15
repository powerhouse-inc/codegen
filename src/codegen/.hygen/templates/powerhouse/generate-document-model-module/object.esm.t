---
to: "<%= rootDir %>/<%= h.changeCase.param(documentType) %>/gen/<%= module %>/object.ts"
force: true
---
import { BaseDocument<% if (actions.find(a => a.hasAttachment)) {%>, AttachmentInput<%}%> } from 'document-model/document';
import {
<% actions.filter(action => action.hasInput).forEach(action => { _%>
    <%= h.changeCase.pascal(action.name) %>Input,
<% }); _%>
    <%= h.changeCase.pascal(documentType) %>State,
    <%= h.changeCase.pascal(documentType) %>LocalState
} from '../types';
import {
<% actions.forEach(action => { _%>
    <%= h.changeCase.camel(action.name) %>,
<% }); _%>
} from './creators';
import { <%= h.changeCase.pascal(documentType) %>Action } from '../actions';

export default class <%= h.changeCase.pascal(documentType) %>_<%= h.changeCase.pascal(module) %> extends BaseDocument<
    <%= h.changeCase.pascal(documentType) %>State,
    <%= h.changeCase.pascal(documentType) %>Action,
    <%= h.changeCase.pascal(documentType) %>LocalState
> {
<% actions.filter(action => action.hasInput).forEach(action => { _%>
    public <%= h.changeCase.camel(action.name) %>(input: <%= h.changeCase.pascal(action.name) %>Input<%if(action.hasAttachment){ %>, attachments: AttachmentInput[] <% } %>) {
        return this.dispatch(<%= h.changeCase.camel(action.name) %>(input<%if(action.hasAttachment){ %>, attachments<% } %>));
    }
    
<% }); _%>
<% actions.filter(action => !action.hasInput).forEach(action => { _%>
    public <%= h.changeCase.camel(action.name) %>() {
        return this.dispatch(<%= h.changeCase.camel(action.name) %>());
    }
    
<% }); _%>
}