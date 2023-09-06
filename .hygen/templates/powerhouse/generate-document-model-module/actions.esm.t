---
to: "<%= rootDir %>/<%= h.changeCase.param(documentType) %>/gen/<%= module %>/actions.ts"
force: true
---
import { Action<% if (actions.find(a => a.hasAttachment)) {%>, ActionWithAttachment<%}%> } from 'document-model/document';
import {
<% actions.filter(a => a.hasInput).forEach(action => { _%>
    <%= action.name %>Input,
<% }); _%>
} from '../types';

<% actions.filter(a => a.hasInput).forEach(actionType => { _%>
export type <%= actionType.name %>Action = Action<%if(actionType.hasAttachment){ %>WithAttachment<% } %><'<%= h.changeCase.constantCase(actionType.name) %>', <%= actionType.name %>Input>;
<% }); _%>
<% actions.filter(a => !a.hasInput).forEach(actionType => { _%>
export type <%= actionType.name %>Action = Action<'<%= h.changeCase.constantCase(actionType.name) %>', never>;
<% }); _%>

export type <%= documentType %><%= h.changeCase.pascal(module) %>Action = 
<% actions.forEach(actionType => { _%>
    | <%= actionType.name %>Action
<% }); _%>;