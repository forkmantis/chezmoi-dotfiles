from talon import Context, Module
mod = Module()
ctx = Context()

mod.list('contexts', desc='My list of to do contexts')
ctx.lists['user.contexts'] = ['work', 'home']
