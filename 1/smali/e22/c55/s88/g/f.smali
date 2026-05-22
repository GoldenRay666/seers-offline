.class Le22/c55/s88/g/f;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Le22/c55/s88/g/a;


# direct methods
.method constructor <init>(Le22/c55/s88/g/a;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/f;->a:Le22/c55/s88/g/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/f;->a:Le22/c55/s88/g/a;

    invoke-static {v0}, Le22/c55/s88/g/a;->d(Le22/c55/s88/g/a;)Le22/c55/s88/e/j;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Le22/c55/s88/e/j;->j:Z

    iget-object v0, p0, Le22/c55/s88/g/f;->a:Le22/c55/s88/g/a;

    iget-object v0, v0, Le22/c55/s88/g/a;->a:Le22/c55/s88/ui/i;

    sget-object v1, Le22/c55/s88/f/e;->P:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/i;->h(Ljava/lang/String;)V

    return-void
.end method
