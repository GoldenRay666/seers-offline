.class public Le22/c55/s88/ui/a;
.super Ljava/lang/Object;


# instance fields
.field public a:Z

.field public b:Landroid/view/View;

.field public c:Le22/c55/s88/ui/d;

.field public d:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Le22/c55/s88/ui/a;->a:Z

    return-void
.end method


# virtual methods
.method public a()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/a;->b:Landroid/view/View;

    return-object v0
.end method

.method public a(I)V
    .locals 0

    iput p1, p0, Le22/c55/s88/ui/a;->d:I

    return-void
.end method

.method public a(Le22/c55/s88/ui/d;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/ui/a;->c:Le22/c55/s88/ui/d;

    return-void
.end method

.method public a(Z)V
    .locals 0

    iput-boolean p1, p0, Le22/c55/s88/ui/a;->a:Z

    return-void
.end method

.method public b()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
