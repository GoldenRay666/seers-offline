.class Le22/c55/s88/g/k;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/g/g;


# direct methods
.method constructor <init>(Le22/c55/s88/g/g;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/k;->a:Le22/c55/s88/g/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Le22/c55/s88/g/k;->a:Le22/c55/s88/g/g;

    invoke-static {v0}, Le22/c55/s88/g/g;->c(Le22/c55/s88/g/g;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/k;->a:Le22/c55/s88/g/g;

    invoke-static {v0}, Le22/c55/s88/g/g;->e(Le22/c55/s88/g/g;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/k;->a:Le22/c55/s88/g/g;

    invoke-static {v1}, Le22/c55/s88/g/g;->d(Le22/c55/s88/g/g;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getWallpaperDesiredMinimumHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Le22/c55/s88/g/k;->a:Le22/c55/s88/g/g;

    invoke-static {v0}, Le22/c55/s88/g/g;->f(Le22/c55/s88/g/g;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/k;->a:Le22/c55/s88/g/g;

    invoke-static {v1}, Le22/c55/s88/g/g;->d(Le22/c55/s88/g/g;)Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0xd

    invoke-static {v1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le22/c55/s88/g/k;->a:Le22/c55/s88/g/g;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Le22/c55/s88/g/g;->a(Le22/c55/s88/g/g;Z)Z

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/k;->a:Le22/c55/s88/g/g;

    invoke-static {v0}, Le22/c55/s88/g/g;->e(Le22/c55/s88/g/g;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Le22/c55/s88/g/k;->a:Le22/c55/s88/g/g;

    invoke-static {v0}, Le22/c55/s88/g/g;->f(Le22/c55/s88/g/g;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/k;->a:Le22/c55/s88/g/g;

    invoke-static {v1}, Le22/c55/s88/g/g;->d(Le22/c55/s88/g/g;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le22/c55/s88/g/k;->a:Le22/c55/s88/g/g;

    invoke-static {v0, v2}, Le22/c55/s88/g/g;->a(Le22/c55/s88/g/g;Z)Z

    goto :goto_0
.end method
