mod config;
mod command;

#[derive(structopt::StructOpt)]
enum Command {
    /// Install configurations and the programs they are configuring.
    Install(command::install::Args),
    /// Update configurations of programs.
    Update(command::update::Args),
}

#[paw::main]
fn main(args: Command) {
    match args {
        Command::Install(args) => {},
        Command::Update(args) => {},
    }
}
