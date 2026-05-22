.class final Le22/c55/s88/n;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:I

.field final synthetic b:Landroid/content/Context;


# direct methods
.method constructor <init>(ILandroid/content/Context;)V
    .locals 0

    iput p1, p0, Le22/c55/s88/n;->a:I

    iput-object p2, p0, Le22/c55/s88/n;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    iget v2, p0, Le22/c55/s88/n;->a:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/n;->b:Landroid/content/Context;

    invoke-static {v1, v0}, Le22/c55/s88/Vrr;->a(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
