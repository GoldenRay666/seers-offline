.class Le22/c55/s88/e/e;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Le22/c55/s88/e/d;


# direct methods
.method constructor <init>(Le22/c55/s88/e/d;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/e/e;->a:Le22/c55/s88/e/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const-string v0, "show noti msg"

    invoke-static {v0}, Le22/c55/s88/f/g;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Le22/c55/s88/e/e;->a:Le22/c55/s88/e/d;

    iget-object v0, v0, Le22/c55/s88/e/d;->b:Le22/c55/s88/e/c;

    iget-object v0, v0, Le22/c55/s88/e/c;->a:Le22/c55/s88/e/b;

    invoke-static {v0}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/b;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/e/e;->a:Le22/c55/s88/e/d;

    iget-object v1, v1, Le22/c55/s88/e/d;->a:Le22/c55/s88/e/j;

    invoke-static {v0, v1}, Le22/c55/s88/e/b;->a(Landroid/content/Context;Le22/c55/s88/e/j;)V

    return-void
.end method
