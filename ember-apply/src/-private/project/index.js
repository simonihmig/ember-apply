// @ts-check

/**
 * Public API for the project namespace
 */
export { gitRoot, gitIgnore } from './git.js';

export { getPackageManager, getPackageManagerLockfile } from './package-manager.js';

export { inWorkspace, eachWorkspace, getWorkspaces, workspaceRoot } from './workspace.js';
