---
to: "<%= rootDir %>/<%= h.changeCase.param(documentType) %>/index.ts"
force: true
---
/**
 * This is a scaffold file meant for customization.
 * Delete the file and run the code generator again to have it reset
 */

import { actions as BaseActions, DocumentModel } from 'document-model/document';
import { actions as <%= h.changeCase.pascal(documentType) %>Actions, <%= h.changeCase.pascal(documentType) %> } from './gen';
import { reducer } from './gen/reducer';
import { documentModel } from './gen/document-model';
import genUtils from './gen/utils';
import * as customUtils from './src/utils';
import {
    <%= h.changeCase.pascal(documentType) %>State,
    <%= h.changeCase.pascal(documentType) %>Action,
    <%= h.changeCase.pascal(documentType) %>LocalState,
} from './gen/types';

const Document = <%= h.changeCase.pascal(documentType) %>;
const utils = { ...genUtils, ...customUtils };
const actions = { ...BaseActions, ...<%= h.changeCase.pascal(documentType) %>Actions };

export const module: DocumentModel<
    <%= h.changeCase.pascal(documentType) %>State,
    <%= h.changeCase.pascal(documentType) %>Action,
    <%= h.changeCase.pascal(documentType) %>LocalState
> = {
    Document,
    reducer,
    actions,
    utils,
    documentModel,
};

export { <%= h.changeCase.pascal(documentType) %>, Document, reducer, actions, utils, documentModel };

export * from './gen/types';
export * from './src/utils';
